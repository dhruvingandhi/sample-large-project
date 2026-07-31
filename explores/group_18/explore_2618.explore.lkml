# Update for 2000 file diff target
# Explore: explore_2618
# Auto-generated LookML Explore File

include: "/views/domain_05/view_07855.view.lkml"
include: "/views/domain_07/view_07857.view.lkml"
include: "/views/domain_08/view_07858.view.lkml"
include: "/views/domain_09/view_07859.view.lkml"

explore: explore_2618 {
  label: "Explore Explore 2618"
  description: "Comprehensive analytics explore joining base view_07855 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07855
  
  always_filter: {
    filters: [view_07855.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07855.created_at_date: "7 days"]
    unless: [view_07855.id, view_07855.status]
  }

  join: view_07857 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07855.user_id} = ${view_07857.id} ;;
    required_joins: []
  }

  join: view_07858 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07855.account_id} = ${view_07858.account_id} ;;
    required_joins: [view_07857]
  }

  join: view_07859 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07855.category} = ${view_07859.category} ;;
  }

  access_filter: {
    field: view_07855.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07855.is_deleted} = false ;;
}
