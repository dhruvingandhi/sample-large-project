# Explore: explore_3231
# Auto-generated LookML Explore File

include: "/views/domain_44/view_09694.view.lkml"
include: "/views/domain_46/view_09696.view.lkml"
include: "/views/domain_47/view_09697.view.lkml"
include: "/views/domain_48/view_09698.view.lkml"

explore: explore_3231 {
  label: "Explore Explore 3231"
  description: "Comprehensive analytics explore joining base view_09694 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09694
  
  always_filter: {
    filters: [view_09694.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09694.created_at_date: "7 days"]
    unless: [view_09694.id, view_09694.status]
  }

  join: view_09696 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09694.user_id} = ${view_09696.id} ;;
    required_joins: []
  }

  join: view_09697 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09694.account_id} = ${view_09697.account_id} ;;
    required_joins: [view_09696]
  }

  join: view_09698 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09694.category} = ${view_09698.category} ;;
  }

  access_filter: {
    field: view_09694.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09694.is_deleted} = false ;;
}
