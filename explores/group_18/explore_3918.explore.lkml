# Update for 2000 file diff target
# Explore: explore_3918
# Auto-generated LookML Explore File

include: "/views/domain_05/view_11755.view.lkml"
include: "/views/domain_07/view_11757.view.lkml"
include: "/views/domain_08/view_11758.view.lkml"
include: "/views/domain_09/view_11759.view.lkml"

explore: explore_3918 {
  label: "Explore Explore 3918"
  description: "Comprehensive analytics explore joining base view_11755 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11755
  
  always_filter: {
    filters: [view_11755.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11755.created_at_date: "7 days"]
    unless: [view_11755.id, view_11755.status]
  }

  join: view_11757 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11755.user_id} = ${view_11757.id} ;;
    required_joins: []
  }

  join: view_11758 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11755.account_id} = ${view_11758.account_id} ;;
    required_joins: [view_11757]
  }

  join: view_11759 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11755.category} = ${view_11759.category} ;;
  }

  access_filter: {
    field: view_11755.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11755.is_deleted} = false ;;
}
