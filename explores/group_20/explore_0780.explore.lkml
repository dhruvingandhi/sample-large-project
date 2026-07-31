# Update for 2000 file diff target
# Explore: explore_0780
# Auto-generated LookML Explore File

include: "/views/domain_41/view_02341.view.lkml"
include: "/views/domain_43/view_02343.view.lkml"
include: "/views/domain_44/view_02344.view.lkml"
include: "/views/domain_45/view_02345.view.lkml"

explore: explore_0780 {
  label: "Explore Explore 0780"
  description: "Comprehensive analytics explore joining base view_02341 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02341
  
  always_filter: {
    filters: [view_02341.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02341.created_at_date: "7 days"]
    unless: [view_02341.id, view_02341.status]
  }

  join: view_02343 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02341.user_id} = ${view_02343.id} ;;
    required_joins: []
  }

  join: view_02344 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02341.account_id} = ${view_02344.account_id} ;;
    required_joins: [view_02343]
  }

  join: view_02345 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02341.category} = ${view_02345.category} ;;
  }

  access_filter: {
    field: view_02341.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02341.is_deleted} = false ;;
}
