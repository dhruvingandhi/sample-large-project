# Explore: explore_2631
# Auto-generated LookML Explore File

include: "/views/domain_44/view_07894.view.lkml"
include: "/views/domain_46/view_07896.view.lkml"
include: "/views/domain_47/view_07897.view.lkml"
include: "/views/domain_48/view_07898.view.lkml"

explore: explore_2631 {
  label: "Explore Explore 2631"
  description: "Comprehensive analytics explore joining base view_07894 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07894
  
  always_filter: {
    filters: [view_07894.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07894.created_at_date: "7 days"]
    unless: [view_07894.id, view_07894.status]
  }

  join: view_07896 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07894.user_id} = ${view_07896.id} ;;
    required_joins: []
  }

  join: view_07897 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07894.account_id} = ${view_07897.account_id} ;;
    required_joins: [view_07896]
  }

  join: view_07898 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07894.category} = ${view_07898.category} ;;
  }

  access_filter: {
    field: view_07894.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07894.is_deleted} = false ;;
}
