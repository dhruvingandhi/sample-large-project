# Explore: explore_1233
# Auto-generated LookML Explore File

include: "/views/domain_50/view_03700.view.lkml"
include: "/views/domain_02/view_03702.view.lkml"
include: "/views/domain_03/view_03703.view.lkml"
include: "/views/domain_04/view_03704.view.lkml"

explore: explore_1233 {
  label: "Explore Explore 1233"
  description: "Comprehensive analytics explore joining base view_03700 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03700
  
  always_filter: {
    filters: [view_03700.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03700.created_at_date: "7 days"]
    unless: [view_03700.id, view_03700.status]
  }

  join: view_03702 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03700.user_id} = ${view_03702.id} ;;
    required_joins: []
  }

  join: view_03703 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03700.account_id} = ${view_03703.account_id} ;;
    required_joins: [view_03702]
  }

  join: view_03704 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03700.category} = ${view_03704.category} ;;
  }

  access_filter: {
    field: view_03700.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03700.is_deleted} = false ;;
}
