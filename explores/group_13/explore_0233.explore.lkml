# Explore: explore_0233
# Auto-generated LookML Explore File

include: "/views/domain_50/view_00700.view.lkml"
include: "/views/domain_02/view_00702.view.lkml"
include: "/views/domain_03/view_00703.view.lkml"
include: "/views/domain_04/view_00704.view.lkml"

explore: explore_0233 {
  label: "Explore Explore 0233"
  description: "Comprehensive analytics explore joining base view_00700 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00700
  
  always_filter: {
    filters: [view_00700.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00700.created_at_date: "7 days"]
    unless: [view_00700.id, view_00700.status]
  }

  join: view_00702 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00700.user_id} = ${view_00702.id} ;;
    required_joins: []
  }

  join: view_00703 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00700.account_id} = ${view_00703.account_id} ;;
    required_joins: [view_00702]
  }

  join: view_00704 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00700.category} = ${view_00704.category} ;;
  }

  access_filter: {
    field: view_00700.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00700.is_deleted} = false ;;
}
