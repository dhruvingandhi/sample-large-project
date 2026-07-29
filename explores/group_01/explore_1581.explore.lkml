# Explore: explore_1581
# Auto-generated LookML Explore File

include: "/views/domain_44/view_04744.view.lkml"
include: "/views/domain_46/view_04746.view.lkml"
include: "/views/domain_47/view_04747.view.lkml"
include: "/views/domain_48/view_04748.view.lkml"

explore: explore_1581 {
  label: "Explore Explore 1581"
  description: "Comprehensive analytics explore joining base view_04744 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04744
  
  always_filter: {
    filters: [view_04744.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04744.created_at_date: "7 days"]
    unless: [view_04744.id, view_04744.status]
  }

  join: view_04746 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04744.user_id} = ${view_04746.id} ;;
    required_joins: []
  }

  join: view_04747 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04744.account_id} = ${view_04747.account_id} ;;
    required_joins: [view_04746]
  }

  join: view_04748 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04744.category} = ${view_04748.category} ;;
  }

  access_filter: {
    field: view_04744.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04744.is_deleted} = false ;;
}
