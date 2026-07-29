# Explore: explore_0391
# Auto-generated LookML Explore File

include: "/views/domain_24/view_01174.view.lkml"
include: "/views/domain_26/view_01176.view.lkml"
include: "/views/domain_27/view_01177.view.lkml"
include: "/views/domain_28/view_01178.view.lkml"

explore: explore_0391 {
  label: "Explore Explore 0391"
  description: "Comprehensive analytics explore joining base view_01174 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01174
  
  always_filter: {
    filters: [view_01174.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01174.created_at_date: "7 days"]
    unless: [view_01174.id, view_01174.status]
  }

  join: view_01176 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01174.user_id} = ${view_01176.id} ;;
    required_joins: []
  }

  join: view_01177 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01174.account_id} = ${view_01177.account_id} ;;
    required_joins: [view_01176]
  }

  join: view_01178 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01174.category} = ${view_01178.category} ;;
  }

  access_filter: {
    field: view_01174.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01174.is_deleted} = false ;;
}
