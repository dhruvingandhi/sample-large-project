# Update for 2000 file diff target
# Explore: explore_1180
# Auto-generated LookML Explore File

include: "/views/domain_41/view_03541.view.lkml"
include: "/views/domain_43/view_03543.view.lkml"
include: "/views/domain_44/view_03544.view.lkml"
include: "/views/domain_45/view_03545.view.lkml"

explore: explore_1180 {
  label: "Explore Explore 1180"
  description: "Comprehensive analytics explore joining base view_03541 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03541
  
  always_filter: {
    filters: [view_03541.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03541.created_at_date: "7 days"]
    unless: [view_03541.id, view_03541.status]
  }

  join: view_03543 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03541.user_id} = ${view_03543.id} ;;
    required_joins: []
  }

  join: view_03544 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03541.account_id} = ${view_03544.account_id} ;;
    required_joins: [view_03543]
  }

  join: view_03545 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03541.category} = ${view_03545.category} ;;
  }

  access_filter: {
    field: view_03541.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03541.is_deleted} = false ;;
}
