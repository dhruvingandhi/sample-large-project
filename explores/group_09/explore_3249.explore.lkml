# Explore: explore_3249
# Auto-generated LookML Explore File

include: "/views/domain_48/view_09748.view.lkml"
include: "/views/domain_50/view_09750.view.lkml"
include: "/views/domain_01/view_09751.view.lkml"
include: "/views/domain_02/view_09752.view.lkml"

explore: explore_3249 {
  label: "Explore Explore 3249"
  description: "Comprehensive analytics explore joining base view_09748 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09748
  
  always_filter: {
    filters: [view_09748.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09748.created_at_date: "7 days"]
    unless: [view_09748.id, view_09748.status]
  }

  join: view_09750 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09748.user_id} = ${view_09750.id} ;;
    required_joins: []
  }

  join: view_09751 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09748.account_id} = ${view_09751.account_id} ;;
    required_joins: [view_09750]
  }

  join: view_09752 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09748.category} = ${view_09752.category} ;;
  }

  access_filter: {
    field: view_09748.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09748.is_deleted} = false ;;
}
