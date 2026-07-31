# Update for 2000 file diff target
# Explore: explore_0870
# Auto-generated LookML Explore File

include: "/views/domain_11/view_02611.view.lkml"
include: "/views/domain_13/view_02613.view.lkml"
include: "/views/domain_14/view_02614.view.lkml"
include: "/views/domain_15/view_02615.view.lkml"

explore: explore_0870 {
  label: "Explore Explore 0870"
  description: "Comprehensive analytics explore joining base view_02611 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02611
  
  always_filter: {
    filters: [view_02611.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02611.created_at_date: "7 days"]
    unless: [view_02611.id, view_02611.status]
  }

  join: view_02613 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02611.user_id} = ${view_02613.id} ;;
    required_joins: []
  }

  join: view_02614 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02611.account_id} = ${view_02614.account_id} ;;
    required_joins: [view_02613]
  }

  join: view_02615 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02611.category} = ${view_02615.category} ;;
  }

  access_filter: {
    field: view_02611.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02611.is_deleted} = false ;;
}
