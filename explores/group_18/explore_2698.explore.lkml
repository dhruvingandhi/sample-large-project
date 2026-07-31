# Update for 2000 file diff target
# Explore: explore_2698
# Auto-generated LookML Explore File

include: "/views/domain_45/view_08095.view.lkml"
include: "/views/domain_47/view_08097.view.lkml"
include: "/views/domain_48/view_08098.view.lkml"
include: "/views/domain_49/view_08099.view.lkml"

explore: explore_2698 {
  label: "Explore Explore 2698"
  description: "Comprehensive analytics explore joining base view_08095 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08095
  
  always_filter: {
    filters: [view_08095.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08095.created_at_date: "7 days"]
    unless: [view_08095.id, view_08095.status]
  }

  join: view_08097 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08095.user_id} = ${view_08097.id} ;;
    required_joins: []
  }

  join: view_08098 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08095.account_id} = ${view_08098.account_id} ;;
    required_joins: [view_08097]
  }

  join: view_08099 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08095.category} = ${view_08099.category} ;;
  }

  access_filter: {
    field: view_08095.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08095.is_deleted} = false ;;
}
