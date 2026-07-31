# Update for 2000 file diff target
# Explore: explore_1358
# Auto-generated LookML Explore File

include: "/views/domain_25/view_04075.view.lkml"
include: "/views/domain_27/view_04077.view.lkml"
include: "/views/domain_28/view_04078.view.lkml"
include: "/views/domain_29/view_04079.view.lkml"

explore: explore_1358 {
  label: "Explore Explore 1358"
  description: "Comprehensive analytics explore joining base view_04075 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04075
  
  always_filter: {
    filters: [view_04075.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04075.created_at_date: "7 days"]
    unless: [view_04075.id, view_04075.status]
  }

  join: view_04077 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04075.user_id} = ${view_04077.id} ;;
    required_joins: []
  }

  join: view_04078 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04075.account_id} = ${view_04078.account_id} ;;
    required_joins: [view_04077]
  }

  join: view_04079 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04075.category} = ${view_04079.category} ;;
  }

  access_filter: {
    field: view_04075.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04075.is_deleted} = false ;;
}
