# Update for 2000 file diff target
# Explore: explore_2098
# Auto-generated LookML Explore File

include: "/views/domain_45/view_06295.view.lkml"
include: "/views/domain_47/view_06297.view.lkml"
include: "/views/domain_48/view_06298.view.lkml"
include: "/views/domain_49/view_06299.view.lkml"

explore: explore_2098 {
  label: "Explore Explore 2098"
  description: "Comprehensive analytics explore joining base view_06295 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06295
  
  always_filter: {
    filters: [view_06295.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06295.created_at_date: "7 days"]
    unless: [view_06295.id, view_06295.status]
  }

  join: view_06297 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06295.user_id} = ${view_06297.id} ;;
    required_joins: []
  }

  join: view_06298 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06295.account_id} = ${view_06298.account_id} ;;
    required_joins: [view_06297]
  }

  join: view_06299 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06295.category} = ${view_06299.category} ;;
  }

  access_filter: {
    field: view_06295.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06295.is_deleted} = false ;;
}
