# Explore: explore_2391
# Auto-generated LookML Explore File

include: "/views/domain_24/view_07174.view.lkml"
include: "/views/domain_26/view_07176.view.lkml"
include: "/views/domain_27/view_07177.view.lkml"
include: "/views/domain_28/view_07178.view.lkml"

explore: explore_2391 {
  label: "Explore Explore 2391"
  description: "Comprehensive analytics explore joining base view_07174 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07174
  
  always_filter: {
    filters: [view_07174.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07174.created_at_date: "7 days"]
    unless: [view_07174.id, view_07174.status]
  }

  join: view_07176 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07174.user_id} = ${view_07176.id} ;;
    required_joins: []
  }

  join: view_07177 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07174.account_id} = ${view_07177.account_id} ;;
    required_joins: [view_07176]
  }

  join: view_07178 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07174.category} = ${view_07178.category} ;;
  }

  access_filter: {
    field: view_07174.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07174.is_deleted} = false ;;
}
