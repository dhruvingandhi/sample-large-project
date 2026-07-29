# Explore: explore_0649
# Auto-generated LookML Explore File

include: "/views/domain_48/view_01948.view.lkml"
include: "/views/domain_50/view_01950.view.lkml"
include: "/views/domain_01/view_01951.view.lkml"
include: "/views/domain_02/view_01952.view.lkml"

explore: explore_0649 {
  label: "Explore Explore 0649"
  description: "Comprehensive analytics explore joining base view_01948 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01948
  
  always_filter: {
    filters: [view_01948.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01948.created_at_date: "7 days"]
    unless: [view_01948.id, view_01948.status]
  }

  join: view_01950 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01948.user_id} = ${view_01950.id} ;;
    required_joins: []
  }

  join: view_01951 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01948.account_id} = ${view_01951.account_id} ;;
    required_joins: [view_01950]
  }

  join: view_01952 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01948.category} = ${view_01952.category} ;;
  }

  access_filter: {
    field: view_01948.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01948.is_deleted} = false ;;
}
