# Update for 2000 file diff target
# Explore: explore_2359
# Auto-generated LookML Explore File

include: "/views/domain_28/view_07078.view.lkml"
include: "/views/domain_30/view_07080.view.lkml"
include: "/views/domain_31/view_07081.view.lkml"
include: "/views/domain_32/view_07082.view.lkml"

explore: explore_2359 {
  label: "Explore Explore 2359"
  description: "Comprehensive analytics explore joining base view_07078 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07078
  
  always_filter: {
    filters: [view_07078.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07078.created_at_date: "7 days"]
    unless: [view_07078.id, view_07078.status]
  }

  join: view_07080 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07078.user_id} = ${view_07080.id} ;;
    required_joins: []
  }

  join: view_07081 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07078.account_id} = ${view_07081.account_id} ;;
    required_joins: [view_07080]
  }

  join: view_07082 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07078.category} = ${view_07082.category} ;;
  }

  access_filter: {
    field: view_07078.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07078.is_deleted} = false ;;
}
