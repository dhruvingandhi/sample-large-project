# Explore: explore_2798
# Auto-generated LookML Explore File

include: "/views/domain_45/view_08395.view.lkml"
include: "/views/domain_47/view_08397.view.lkml"
include: "/views/domain_48/view_08398.view.lkml"
include: "/views/domain_49/view_08399.view.lkml"

explore: explore_2798 {
  label: "Explore Explore 2798"
  description: "Comprehensive analytics explore joining base view_08395 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08395
  
  always_filter: {
    filters: [view_08395.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08395.created_at_date: "7 days"]
    unless: [view_08395.id, view_08395.status]
  }

  join: view_08397 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08395.user_id} = ${view_08397.id} ;;
    required_joins: []
  }

  join: view_08398 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08395.account_id} = ${view_08398.account_id} ;;
    required_joins: [view_08397]
  }

  join: view_08399 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08395.category} = ${view_08399.category} ;;
  }

  access_filter: {
    field: view_08395.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08395.is_deleted} = false ;;
}
