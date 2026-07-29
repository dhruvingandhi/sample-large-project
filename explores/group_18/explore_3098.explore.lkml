# Explore: explore_3098
# Auto-generated LookML Explore File

include: "/views/domain_45/view_09295.view.lkml"
include: "/views/domain_47/view_09297.view.lkml"
include: "/views/domain_48/view_09298.view.lkml"
include: "/views/domain_49/view_09299.view.lkml"

explore: explore_3098 {
  label: "Explore Explore 3098"
  description: "Comprehensive analytics explore joining base view_09295 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09295
  
  always_filter: {
    filters: [view_09295.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09295.created_at_date: "7 days"]
    unless: [view_09295.id, view_09295.status]
  }

  join: view_09297 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09295.user_id} = ${view_09297.id} ;;
    required_joins: []
  }

  join: view_09298 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09295.account_id} = ${view_09298.account_id} ;;
    required_joins: [view_09297]
  }

  join: view_09299 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09295.category} = ${view_09299.category} ;;
  }

  access_filter: {
    field: view_09295.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09295.is_deleted} = false ;;
}
