# Update for 2000 file diff target
# Explore: explore_0338
# Auto-generated LookML Explore File

include: "/views/domain_15/view_01015.view.lkml"
include: "/views/domain_17/view_01017.view.lkml"
include: "/views/domain_18/view_01018.view.lkml"
include: "/views/domain_19/view_01019.view.lkml"

explore: explore_0338 {
  label: "Explore Explore 0338"
  description: "Comprehensive analytics explore joining base view_01015 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01015
  
  always_filter: {
    filters: [view_01015.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01015.created_at_date: "7 days"]
    unless: [view_01015.id, view_01015.status]
  }

  join: view_01017 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01015.user_id} = ${view_01017.id} ;;
    required_joins: []
  }

  join: view_01018 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01015.account_id} = ${view_01018.account_id} ;;
    required_joins: [view_01017]
  }

  join: view_01019 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01015.category} = ${view_01019.category} ;;
  }

  access_filter: {
    field: view_01015.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01015.is_deleted} = false ;;
}
