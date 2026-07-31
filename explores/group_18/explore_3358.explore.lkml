# Update for 2000 file diff target
# Explore: explore_3358
# Auto-generated LookML Explore File

include: "/views/domain_25/view_10075.view.lkml"
include: "/views/domain_27/view_10077.view.lkml"
include: "/views/domain_28/view_10078.view.lkml"
include: "/views/domain_29/view_10079.view.lkml"

explore: explore_3358 {
  label: "Explore Explore 3358"
  description: "Comprehensive analytics explore joining base view_10075 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10075
  
  always_filter: {
    filters: [view_10075.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10075.created_at_date: "7 days"]
    unless: [view_10075.id, view_10075.status]
  }

  join: view_10077 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10075.user_id} = ${view_10077.id} ;;
    required_joins: []
  }

  join: view_10078 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10075.account_id} = ${view_10078.account_id} ;;
    required_joins: [view_10077]
  }

  join: view_10079 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10075.category} = ${view_10079.category} ;;
  }

  access_filter: {
    field: view_10075.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10075.is_deleted} = false ;;
}
