# Explore: explore_3782
# Auto-generated LookML Explore File

include: "/views/domain_47/view_11347.view.lkml"
include: "/views/domain_49/view_11349.view.lkml"
include: "/views/domain_50/view_11350.view.lkml"
include: "/views/domain_01/view_11351.view.lkml"

explore: explore_3782 {
  label: "Explore Explore 3782"
  description: "Comprehensive analytics explore joining base view_11347 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11347
  
  always_filter: {
    filters: [view_11347.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11347.created_at_date: "7 days"]
    unless: [view_11347.id, view_11347.status]
  }

  join: view_11349 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11347.user_id} = ${view_11349.id} ;;
    required_joins: []
  }

  join: view_11350 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11347.account_id} = ${view_11350.account_id} ;;
    required_joins: [view_11349]
  }

  join: view_11351 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11347.category} = ${view_11351.category} ;;
  }

  access_filter: {
    field: view_11347.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11347.is_deleted} = false ;;
}
