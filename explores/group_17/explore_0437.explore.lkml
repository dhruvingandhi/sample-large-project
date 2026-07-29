# Explore: explore_0437
# Auto-generated LookML Explore File

include: "/views/domain_12/view_01312.view.lkml"
include: "/views/domain_14/view_01314.view.lkml"
include: "/views/domain_15/view_01315.view.lkml"
include: "/views/domain_16/view_01316.view.lkml"

explore: explore_0437 {
  label: "Explore Explore 0437"
  description: "Comprehensive analytics explore joining base view_01312 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01312
  
  always_filter: {
    filters: [view_01312.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01312.created_at_date: "7 days"]
    unless: [view_01312.id, view_01312.status]
  }

  join: view_01314 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01312.user_id} = ${view_01314.id} ;;
    required_joins: []
  }

  join: view_01315 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01312.account_id} = ${view_01315.account_id} ;;
    required_joins: [view_01314]
  }

  join: view_01316 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01312.category} = ${view_01316.category} ;;
  }

  access_filter: {
    field: view_01312.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01312.is_deleted} = false ;;
}
