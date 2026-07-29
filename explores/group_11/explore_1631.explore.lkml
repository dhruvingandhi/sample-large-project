# Explore: explore_1631
# Auto-generated LookML Explore File

include: "/views/domain_44/view_04894.view.lkml"
include: "/views/domain_46/view_04896.view.lkml"
include: "/views/domain_47/view_04897.view.lkml"
include: "/views/domain_48/view_04898.view.lkml"

explore: explore_1631 {
  label: "Explore Explore 1631"
  description: "Comprehensive analytics explore joining base view_04894 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04894
  
  always_filter: {
    filters: [view_04894.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04894.created_at_date: "7 days"]
    unless: [view_04894.id, view_04894.status]
  }

  join: view_04896 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04894.user_id} = ${view_04896.id} ;;
    required_joins: []
  }

  join: view_04897 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04894.account_id} = ${view_04897.account_id} ;;
    required_joins: [view_04896]
  }

  join: view_04898 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04894.category} = ${view_04898.category} ;;
  }

  access_filter: {
    field: view_04894.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04894.is_deleted} = false ;;
}
