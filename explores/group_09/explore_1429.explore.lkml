# Explore: explore_1429
# Auto-generated LookML Explore File

include: "/views/domain_38/view_04288.view.lkml"
include: "/views/domain_40/view_04290.view.lkml"
include: "/views/domain_41/view_04291.view.lkml"
include: "/views/domain_42/view_04292.view.lkml"

explore: explore_1429 {
  label: "Explore Explore 1429"
  description: "Comprehensive analytics explore joining base view_04288 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04288
  
  always_filter: {
    filters: [view_04288.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04288.created_at_date: "7 days"]
    unless: [view_04288.id, view_04288.status]
  }

  join: view_04290 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04288.user_id} = ${view_04290.id} ;;
    required_joins: []
  }

  join: view_04291 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04288.account_id} = ${view_04291.account_id} ;;
    required_joins: [view_04290]
  }

  join: view_04292 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04288.category} = ${view_04292.category} ;;
  }

  access_filter: {
    field: view_04288.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04288.is_deleted} = false ;;
}
