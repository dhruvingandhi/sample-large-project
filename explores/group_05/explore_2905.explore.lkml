# Explore: explore_2905
# Auto-generated LookML Explore File

include: "/views/domain_16/view_08716.view.lkml"
include: "/views/domain_18/view_08718.view.lkml"
include: "/views/domain_19/view_08719.view.lkml"
include: "/views/domain_20/view_08720.view.lkml"

explore: explore_2905 {
  label: "Explore Explore 2905"
  description: "Comprehensive analytics explore joining base view_08716 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08716
  
  always_filter: {
    filters: [view_08716.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08716.created_at_date: "7 days"]
    unless: [view_08716.id, view_08716.status]
  }

  join: view_08718 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08716.user_id} = ${view_08718.id} ;;
    required_joins: []
  }

  join: view_08719 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08716.account_id} = ${view_08719.account_id} ;;
    required_joins: [view_08718]
  }

  join: view_08720 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08716.category} = ${view_08720.category} ;;
  }

  access_filter: {
    field: view_08716.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08716.is_deleted} = false ;;
}
