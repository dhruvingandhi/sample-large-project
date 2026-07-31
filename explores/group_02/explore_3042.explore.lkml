# Update for 500 file diff target
# Explore: explore_3042
# Auto-generated LookML Explore File

include: "/views/domain_27/view_09127.view.lkml"
include: "/views/domain_29/view_09129.view.lkml"
include: "/views/domain_30/view_09130.view.lkml"
include: "/views/domain_31/view_09131.view.lkml"

explore: explore_3042 {
  label: "Explore Explore 3042"
  description: "Comprehensive analytics explore joining base view_09127 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09127
  
  always_filter: {
    filters: [view_09127.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09127.created_at_date: "7 days"]
    unless: [view_09127.id, view_09127.status]
  }

  join: view_09129 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09127.user_id} = ${view_09129.id} ;;
    required_joins: []
  }

  join: view_09130 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09127.account_id} = ${view_09130.account_id} ;;
    required_joins: [view_09129]
  }

  join: view_09131 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09127.category} = ${view_09131.category} ;;
  }

  access_filter: {
    field: view_09127.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09127.is_deleted} = false ;;
}
