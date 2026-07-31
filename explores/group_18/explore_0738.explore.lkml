# Update for 2000 file diff target
# Explore: explore_0738
# Auto-generated LookML Explore File

include: "/views/domain_15/view_02215.view.lkml"
include: "/views/domain_17/view_02217.view.lkml"
include: "/views/domain_18/view_02218.view.lkml"
include: "/views/domain_19/view_02219.view.lkml"

explore: explore_0738 {
  label: "Explore Explore 0738"
  description: "Comprehensive analytics explore joining base view_02215 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02215
  
  always_filter: {
    filters: [view_02215.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02215.created_at_date: "7 days"]
    unless: [view_02215.id, view_02215.status]
  }

  join: view_02217 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02215.user_id} = ${view_02217.id} ;;
    required_joins: []
  }

  join: view_02218 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02215.account_id} = ${view_02218.account_id} ;;
    required_joins: [view_02217]
  }

  join: view_02219 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02215.category} = ${view_02219.category} ;;
  }

  access_filter: {
    field: view_02215.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02215.is_deleted} = false ;;
}
