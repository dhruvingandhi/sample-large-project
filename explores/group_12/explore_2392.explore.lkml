# Explore: explore_2392
# Auto-generated LookML Explore File

include: "/views/domain_27/view_07177.view.lkml"
include: "/views/domain_29/view_07179.view.lkml"
include: "/views/domain_30/view_07180.view.lkml"
include: "/views/domain_31/view_07181.view.lkml"

explore: explore_2392 {
  label: "Explore Explore 2392"
  description: "Comprehensive analytics explore joining base view_07177 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07177
  
  always_filter: {
    filters: [view_07177.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07177.created_at_date: "7 days"]
    unless: [view_07177.id, view_07177.status]
  }

  join: view_07179 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07177.user_id} = ${view_07179.id} ;;
    required_joins: []
  }

  join: view_07180 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07177.account_id} = ${view_07180.account_id} ;;
    required_joins: [view_07179]
  }

  join: view_07181 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07177.category} = ${view_07181.category} ;;
  }

  access_filter: {
    field: view_07177.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07177.is_deleted} = false ;;
}
