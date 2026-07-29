# Explore: explore_2898
# Auto-generated LookML Explore File

include: "/views/domain_45/view_08695.view.lkml"
include: "/views/domain_47/view_08697.view.lkml"
include: "/views/domain_48/view_08698.view.lkml"
include: "/views/domain_49/view_08699.view.lkml"

explore: explore_2898 {
  label: "Explore Explore 2898"
  description: "Comprehensive analytics explore joining base view_08695 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08695
  
  always_filter: {
    filters: [view_08695.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08695.created_at_date: "7 days"]
    unless: [view_08695.id, view_08695.status]
  }

  join: view_08697 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08695.user_id} = ${view_08697.id} ;;
    required_joins: []
  }

  join: view_08698 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08695.account_id} = ${view_08698.account_id} ;;
    required_joins: [view_08697]
  }

  join: view_08699 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08695.category} = ${view_08699.category} ;;
  }

  access_filter: {
    field: view_08695.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08695.is_deleted} = false ;;
}
