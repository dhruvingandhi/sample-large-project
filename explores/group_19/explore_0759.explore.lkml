# Explore: explore_0759
# Auto-generated LookML Explore File

include: "/views/domain_28/view_02278.view.lkml"
include: "/views/domain_30/view_02280.view.lkml"
include: "/views/domain_31/view_02281.view.lkml"
include: "/views/domain_32/view_02282.view.lkml"

explore: explore_0759 {
  label: "Explore Explore 0759"
  description: "Comprehensive analytics explore joining base view_02278 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02278
  
  always_filter: {
    filters: [view_02278.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02278.created_at_date: "7 days"]
    unless: [view_02278.id, view_02278.status]
  }

  join: view_02280 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02278.user_id} = ${view_02280.id} ;;
    required_joins: []
  }

  join: view_02281 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02278.account_id} = ${view_02281.account_id} ;;
    required_joins: [view_02280]
  }

  join: view_02282 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02278.category} = ${view_02282.category} ;;
  }

  access_filter: {
    field: view_02278.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02278.is_deleted} = false ;;
}
