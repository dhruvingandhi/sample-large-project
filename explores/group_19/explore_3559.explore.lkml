# Update for 2000 file diff target
# Explore: explore_3559
# Auto-generated LookML Explore File

include: "/views/domain_28/view_10678.view.lkml"
include: "/views/domain_30/view_10680.view.lkml"
include: "/views/domain_31/view_10681.view.lkml"
include: "/views/domain_32/view_10682.view.lkml"

explore: explore_3559 {
  label: "Explore Explore 3559"
  description: "Comprehensive analytics explore joining base view_10678 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10678
  
  always_filter: {
    filters: [view_10678.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10678.created_at_date: "7 days"]
    unless: [view_10678.id, view_10678.status]
  }

  join: view_10680 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10678.user_id} = ${view_10680.id} ;;
    required_joins: []
  }

  join: view_10681 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10678.account_id} = ${view_10681.account_id} ;;
    required_joins: [view_10680]
  }

  join: view_10682 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10678.category} = ${view_10682.category} ;;
  }

  access_filter: {
    field: view_10678.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10678.is_deleted} = false ;;
}
