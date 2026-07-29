# Explore: explore_3618
# Auto-generated LookML Explore File

include: "/views/domain_05/view_10855.view.lkml"
include: "/views/domain_07/view_10857.view.lkml"
include: "/views/domain_08/view_10858.view.lkml"
include: "/views/domain_09/view_10859.view.lkml"

explore: explore_3618 {
  label: "Explore Explore 3618"
  description: "Comprehensive analytics explore joining base view_10855 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10855
  
  always_filter: {
    filters: [view_10855.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10855.created_at_date: "7 days"]
    unless: [view_10855.id, view_10855.status]
  }

  join: view_10857 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10855.user_id} = ${view_10857.id} ;;
    required_joins: []
  }

  join: view_10858 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10855.account_id} = ${view_10858.account_id} ;;
    required_joins: [view_10857]
  }

  join: view_10859 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10855.category} = ${view_10859.category} ;;
  }

  access_filter: {
    field: view_10855.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10855.is_deleted} = false ;;
}
