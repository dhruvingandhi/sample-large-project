# Explore: explore_3648
# Auto-generated LookML Explore File

include: "/views/domain_45/view_10945.view.lkml"
include: "/views/domain_47/view_10947.view.lkml"
include: "/views/domain_48/view_10948.view.lkml"
include: "/views/domain_49/view_10949.view.lkml"

explore: explore_3648 {
  label: "Explore Explore 3648"
  description: "Comprehensive analytics explore joining base view_10945 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10945
  
  always_filter: {
    filters: [view_10945.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10945.created_at_date: "7 days"]
    unless: [view_10945.id, view_10945.status]
  }

  join: view_10947 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10945.user_id} = ${view_10947.id} ;;
    required_joins: []
  }

  join: view_10948 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10945.account_id} = ${view_10948.account_id} ;;
    required_joins: [view_10947]
  }

  join: view_10949 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10945.category} = ${view_10949.category} ;;
  }

  access_filter: {
    field: view_10945.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10945.is_deleted} = false ;;
}
