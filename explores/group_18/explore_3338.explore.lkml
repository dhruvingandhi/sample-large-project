# Update for 2000 file diff target
# Explore: explore_3338
# Auto-generated LookML Explore File

include: "/views/domain_15/view_10015.view.lkml"
include: "/views/domain_17/view_10017.view.lkml"
include: "/views/domain_18/view_10018.view.lkml"
include: "/views/domain_19/view_10019.view.lkml"

explore: explore_3338 {
  label: "Explore Explore 3338"
  description: "Comprehensive analytics explore joining base view_10015 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10015
  
  always_filter: {
    filters: [view_10015.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10015.created_at_date: "7 days"]
    unless: [view_10015.id, view_10015.status]
  }

  join: view_10017 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10015.user_id} = ${view_10017.id} ;;
    required_joins: []
  }

  join: view_10018 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10015.account_id} = ${view_10018.account_id} ;;
    required_joins: [view_10017]
  }

  join: view_10019 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10015.category} = ${view_10019.category} ;;
  }

  access_filter: {
    field: view_10015.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10015.is_deleted} = false ;;
}
