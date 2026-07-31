# Update for 2000 file diff target
# Explore: explore_0618
# Auto-generated LookML Explore File

include: "/views/domain_05/view_01855.view.lkml"
include: "/views/domain_07/view_01857.view.lkml"
include: "/views/domain_08/view_01858.view.lkml"
include: "/views/domain_09/view_01859.view.lkml"

explore: explore_0618 {
  label: "Explore Explore 0618"
  description: "Comprehensive analytics explore joining base view_01855 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01855
  
  always_filter: {
    filters: [view_01855.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01855.created_at_date: "7 days"]
    unless: [view_01855.id, view_01855.status]
  }

  join: view_01857 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01855.user_id} = ${view_01857.id} ;;
    required_joins: []
  }

  join: view_01858 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01855.account_id} = ${view_01858.account_id} ;;
    required_joins: [view_01857]
  }

  join: view_01859 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01855.category} = ${view_01859.category} ;;
  }

  access_filter: {
    field: view_01855.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01855.is_deleted} = false ;;
}
