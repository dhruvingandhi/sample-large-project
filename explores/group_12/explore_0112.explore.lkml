# Explore: explore_0112
# Auto-generated LookML Explore File

include: "/views/domain_37/view_00337.view.lkml"
include: "/views/domain_39/view_00339.view.lkml"
include: "/views/domain_40/view_00340.view.lkml"
include: "/views/domain_41/view_00341.view.lkml"

explore: explore_0112 {
  label: "Explore Explore 0112"
  description: "Comprehensive analytics explore joining base view_00337 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00337
  
  always_filter: {
    filters: [view_00337.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00337.created_at_date: "7 days"]
    unless: [view_00337.id, view_00337.status]
  }

  join: view_00339 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00337.user_id} = ${view_00339.id} ;;
    required_joins: []
  }

  join: view_00340 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00337.account_id} = ${view_00340.account_id} ;;
    required_joins: [view_00339]
  }

  join: view_00341 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00337.category} = ${view_00341.category} ;;
  }

  access_filter: {
    field: view_00337.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00337.is_deleted} = false ;;
}
