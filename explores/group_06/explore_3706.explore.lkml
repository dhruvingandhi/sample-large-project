# Explore: explore_3706
# Auto-generated LookML Explore File

include: "/views/domain_19/view_11119.view.lkml"
include: "/views/domain_21/view_11121.view.lkml"
include: "/views/domain_22/view_11122.view.lkml"
include: "/views/domain_23/view_11123.view.lkml"

explore: explore_3706 {
  label: "Explore Explore 3706"
  description: "Comprehensive analytics explore joining base view_11119 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11119
  
  always_filter: {
    filters: [view_11119.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11119.created_at_date: "7 days"]
    unless: [view_11119.id, view_11119.status]
  }

  join: view_11121 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11119.user_id} = ${view_11121.id} ;;
    required_joins: []
  }

  join: view_11122 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11119.account_id} = ${view_11122.account_id} ;;
    required_joins: [view_11121]
  }

  join: view_11123 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11119.category} = ${view_11123.category} ;;
  }

  access_filter: {
    field: view_11119.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11119.is_deleted} = false ;;
}
