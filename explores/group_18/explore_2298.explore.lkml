# Update for 2000 file diff target
# Explore: explore_2298
# Auto-generated LookML Explore File

include: "/views/domain_45/view_06895.view.lkml"
include: "/views/domain_47/view_06897.view.lkml"
include: "/views/domain_48/view_06898.view.lkml"
include: "/views/domain_49/view_06899.view.lkml"

explore: explore_2298 {
  label: "Explore Explore 2298"
  description: "Comprehensive analytics explore joining base view_06895 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06895
  
  always_filter: {
    filters: [view_06895.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06895.created_at_date: "7 days"]
    unless: [view_06895.id, view_06895.status]
  }

  join: view_06897 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06895.user_id} = ${view_06897.id} ;;
    required_joins: []
  }

  join: view_06898 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06895.account_id} = ${view_06898.account_id} ;;
    required_joins: [view_06897]
  }

  join: view_06899 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06895.category} = ${view_06899.category} ;;
  }

  access_filter: {
    field: view_06895.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06895.is_deleted} = false ;;
}
