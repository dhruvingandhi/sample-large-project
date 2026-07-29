# Explore: explore_2630
# Auto-generated LookML Explore File

include: "/views/domain_41/view_07891.view.lkml"
include: "/views/domain_43/view_07893.view.lkml"
include: "/views/domain_44/view_07894.view.lkml"
include: "/views/domain_45/view_07895.view.lkml"

explore: explore_2630 {
  label: "Explore Explore 2630"
  description: "Comprehensive analytics explore joining base view_07891 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07891
  
  always_filter: {
    filters: [view_07891.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07891.created_at_date: "7 days"]
    unless: [view_07891.id, view_07891.status]
  }

  join: view_07893 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07891.user_id} = ${view_07893.id} ;;
    required_joins: []
  }

  join: view_07894 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07891.account_id} = ${view_07894.account_id} ;;
    required_joins: [view_07893]
  }

  join: view_07895 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07891.category} = ${view_07895.category} ;;
  }

  access_filter: {
    field: view_07891.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07891.is_deleted} = false ;;
}
