# Update for 2000 file diff target
# Explore: explore_2079
# Auto-generated LookML Explore File

include: "/views/domain_38/view_06238.view.lkml"
include: "/views/domain_40/view_06240.view.lkml"
include: "/views/domain_41/view_06241.view.lkml"
include: "/views/domain_42/view_06242.view.lkml"

explore: explore_2079 {
  label: "Explore Explore 2079"
  description: "Comprehensive analytics explore joining base view_06238 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06238
  
  always_filter: {
    filters: [view_06238.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06238.created_at_date: "7 days"]
    unless: [view_06238.id, view_06238.status]
  }

  join: view_06240 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06238.user_id} = ${view_06240.id} ;;
    required_joins: []
  }

  join: view_06241 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06238.account_id} = ${view_06241.account_id} ;;
    required_joins: [view_06240]
  }

  join: view_06242 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06238.category} = ${view_06242.category} ;;
  }

  access_filter: {
    field: view_06238.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06238.is_deleted} = false ;;
}
