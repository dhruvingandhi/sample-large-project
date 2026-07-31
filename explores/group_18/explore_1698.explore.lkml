# Update for 2000 file diff target
# Explore: explore_1698
# Auto-generated LookML Explore File

include: "/views/domain_45/view_05095.view.lkml"
include: "/views/domain_47/view_05097.view.lkml"
include: "/views/domain_48/view_05098.view.lkml"
include: "/views/domain_49/view_05099.view.lkml"

explore: explore_1698 {
  label: "Explore Explore 1698"
  description: "Comprehensive analytics explore joining base view_05095 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05095
  
  always_filter: {
    filters: [view_05095.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05095.created_at_date: "7 days"]
    unless: [view_05095.id, view_05095.status]
  }

  join: view_05097 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05095.user_id} = ${view_05097.id} ;;
    required_joins: []
  }

  join: view_05098 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05095.account_id} = ${view_05098.account_id} ;;
    required_joins: [view_05097]
  }

  join: view_05099 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05095.category} = ${view_05099.category} ;;
  }

  access_filter: {
    field: view_05095.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05095.is_deleted} = false ;;
}
