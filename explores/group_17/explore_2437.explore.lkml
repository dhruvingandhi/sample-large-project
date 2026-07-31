# Update for 2000 file diff target
# Explore: explore_2437
# Auto-generated LookML Explore File

include: "/views/domain_12/view_07312.view.lkml"
include: "/views/domain_14/view_07314.view.lkml"
include: "/views/domain_15/view_07315.view.lkml"
include: "/views/domain_16/view_07316.view.lkml"

explore: explore_2437 {
  label: "Explore Explore 2437"
  description: "Comprehensive analytics explore joining base view_07312 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07312
  
  always_filter: {
    filters: [view_07312.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07312.created_at_date: "7 days"]
    unless: [view_07312.id, view_07312.status]
  }

  join: view_07314 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07312.user_id} = ${view_07314.id} ;;
    required_joins: []
  }

  join: view_07315 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07312.account_id} = ${view_07315.account_id} ;;
    required_joins: [view_07314]
  }

  join: view_07316 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07312.category} = ${view_07316.category} ;;
  }

  access_filter: {
    field: view_07312.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07312.is_deleted} = false ;;
}
