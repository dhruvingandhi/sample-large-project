# Explore: explore_1298
# Auto-generated LookML Explore File

include: "/views/domain_45/view_03895.view.lkml"
include: "/views/domain_47/view_03897.view.lkml"
include: "/views/domain_48/view_03898.view.lkml"
include: "/views/domain_49/view_03899.view.lkml"

explore: explore_1298 {
  label: "Explore Explore 1298"
  description: "Comprehensive analytics explore joining base view_03895 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03895
  
  always_filter: {
    filters: [view_03895.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03895.created_at_date: "7 days"]
    unless: [view_03895.id, view_03895.status]
  }

  join: view_03897 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03895.user_id} = ${view_03897.id} ;;
    required_joins: []
  }

  join: view_03898 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03895.account_id} = ${view_03898.account_id} ;;
    required_joins: [view_03897]
  }

  join: view_03899 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03895.category} = ${view_03899.category} ;;
  }

  access_filter: {
    field: view_03895.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03895.is_deleted} = false ;;
}
