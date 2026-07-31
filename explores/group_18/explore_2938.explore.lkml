# Update for 2000 file diff target
# Explore: explore_2938
# Auto-generated LookML Explore File

include: "/views/domain_15/view_08815.view.lkml"
include: "/views/domain_17/view_08817.view.lkml"
include: "/views/domain_18/view_08818.view.lkml"
include: "/views/domain_19/view_08819.view.lkml"

explore: explore_2938 {
  label: "Explore Explore 2938"
  description: "Comprehensive analytics explore joining base view_08815 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08815
  
  always_filter: {
    filters: [view_08815.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08815.created_at_date: "7 days"]
    unless: [view_08815.id, view_08815.status]
  }

  join: view_08817 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08815.user_id} = ${view_08817.id} ;;
    required_joins: []
  }

  join: view_08818 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08815.account_id} = ${view_08818.account_id} ;;
    required_joins: [view_08817]
  }

  join: view_08819 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08815.category} = ${view_08819.category} ;;
  }

  access_filter: {
    field: view_08815.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08815.is_deleted} = false ;;
}
