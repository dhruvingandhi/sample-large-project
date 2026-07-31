# Update for 2000 file diff target
# Explore: explore_2030
# Auto-generated LookML Explore File

include: "/views/domain_41/view_06091.view.lkml"
include: "/views/domain_43/view_06093.view.lkml"
include: "/views/domain_44/view_06094.view.lkml"
include: "/views/domain_45/view_06095.view.lkml"

explore: explore_2030 {
  label: "Explore Explore 2030"
  description: "Comprehensive analytics explore joining base view_06091 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06091
  
  always_filter: {
    filters: [view_06091.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06091.created_at_date: "7 days"]
    unless: [view_06091.id, view_06091.status]
  }

  join: view_06093 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06091.user_id} = ${view_06093.id} ;;
    required_joins: []
  }

  join: view_06094 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06091.account_id} = ${view_06094.account_id} ;;
    required_joins: [view_06093]
  }

  join: view_06095 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06091.category} = ${view_06095.category} ;;
  }

  access_filter: {
    field: view_06091.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06091.is_deleted} = false ;;
}
