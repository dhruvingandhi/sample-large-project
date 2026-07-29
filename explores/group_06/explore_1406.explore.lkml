# Explore: explore_1406
# Auto-generated LookML Explore File

include: "/views/domain_19/view_04219.view.lkml"
include: "/views/domain_21/view_04221.view.lkml"
include: "/views/domain_22/view_04222.view.lkml"
include: "/views/domain_23/view_04223.view.lkml"

explore: explore_1406 {
  label: "Explore Explore 1406"
  description: "Comprehensive analytics explore joining base view_04219 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04219
  
  always_filter: {
    filters: [view_04219.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04219.created_at_date: "7 days"]
    unless: [view_04219.id, view_04219.status]
  }

  join: view_04221 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04219.user_id} = ${view_04221.id} ;;
    required_joins: []
  }

  join: view_04222 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04219.account_id} = ${view_04222.account_id} ;;
    required_joins: [view_04221]
  }

  join: view_04223 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04219.category} = ${view_04223.category} ;;
  }

  access_filter: {
    field: view_04219.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04219.is_deleted} = false ;;
}
