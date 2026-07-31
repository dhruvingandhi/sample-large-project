# Update for 2000 file diff target
# Explore: explore_1899
# Auto-generated LookML Explore File

include: "/views/domain_48/view_05698.view.lkml"
include: "/views/domain_50/view_05700.view.lkml"
include: "/views/domain_01/view_05701.view.lkml"
include: "/views/domain_02/view_05702.view.lkml"

explore: explore_1899 {
  label: "Explore Explore 1899"
  description: "Comprehensive analytics explore joining base view_05698 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05698
  
  always_filter: {
    filters: [view_05698.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05698.created_at_date: "7 days"]
    unless: [view_05698.id, view_05698.status]
  }

  join: view_05700 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05698.user_id} = ${view_05700.id} ;;
    required_joins: []
  }

  join: view_05701 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05698.account_id} = ${view_05701.account_id} ;;
    required_joins: [view_05700]
  }

  join: view_05702 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05698.category} = ${view_05702.category} ;;
  }

  access_filter: {
    field: view_05698.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05698.is_deleted} = false ;;
}
