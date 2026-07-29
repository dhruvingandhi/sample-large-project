# Explore: explore_1448
# Auto-generated LookML Explore File

include: "/views/domain_45/view_04345.view.lkml"
include: "/views/domain_47/view_04347.view.lkml"
include: "/views/domain_48/view_04348.view.lkml"
include: "/views/domain_49/view_04349.view.lkml"

explore: explore_1448 {
  label: "Explore Explore 1448"
  description: "Comprehensive analytics explore joining base view_04345 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04345
  
  always_filter: {
    filters: [view_04345.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04345.created_at_date: "7 days"]
    unless: [view_04345.id, view_04345.status]
  }

  join: view_04347 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04345.user_id} = ${view_04347.id} ;;
    required_joins: []
  }

  join: view_04348 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04345.account_id} = ${view_04348.account_id} ;;
    required_joins: [view_04347]
  }

  join: view_04349 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04345.category} = ${view_04349.category} ;;
  }

  access_filter: {
    field: view_04345.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04345.is_deleted} = false ;;
}
