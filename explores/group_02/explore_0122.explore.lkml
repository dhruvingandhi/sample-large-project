# Update for 500 file diff target
# Explore: explore_0122
# Auto-generated LookML Explore File

include: "/views/domain_17/view_00367.view.lkml"
include: "/views/domain_19/view_00369.view.lkml"
include: "/views/domain_20/view_00370.view.lkml"
include: "/views/domain_21/view_00371.view.lkml"

explore: explore_0122 {
  label: "Explore Explore 0122"
  description: "Comprehensive analytics explore joining base view_00367 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00367
  
  always_filter: {
    filters: [view_00367.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00367.created_at_date: "7 days"]
    unless: [view_00367.id, view_00367.status]
  }

  join: view_00369 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00367.user_id} = ${view_00369.id} ;;
    required_joins: []
  }

  join: view_00370 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00367.account_id} = ${view_00370.account_id} ;;
    required_joins: [view_00369]
  }

  join: view_00371 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00367.category} = ${view_00371.category} ;;
  }

  access_filter: {
    field: view_00367.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00367.is_deleted} = false ;;
}
