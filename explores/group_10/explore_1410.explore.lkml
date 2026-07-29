# Explore: explore_1410
# Auto-generated LookML Explore File

include: "/views/domain_31/view_04231.view.lkml"
include: "/views/domain_33/view_04233.view.lkml"
include: "/views/domain_34/view_04234.view.lkml"
include: "/views/domain_35/view_04235.view.lkml"

explore: explore_1410 {
  label: "Explore Explore 1410"
  description: "Comprehensive analytics explore joining base view_04231 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04231
  
  always_filter: {
    filters: [view_04231.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04231.created_at_date: "7 days"]
    unless: [view_04231.id, view_04231.status]
  }

  join: view_04233 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04231.user_id} = ${view_04233.id} ;;
    required_joins: []
  }

  join: view_04234 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04231.account_id} = ${view_04234.account_id} ;;
    required_joins: [view_04233]
  }

  join: view_04235 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04231.category} = ${view_04235.category} ;;
  }

  access_filter: {
    field: view_04231.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04231.is_deleted} = false ;;
}
