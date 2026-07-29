# Explore: explore_2589
# Auto-generated LookML Explore File

include: "/views/domain_18/view_07768.view.lkml"
include: "/views/domain_20/view_07770.view.lkml"
include: "/views/domain_21/view_07771.view.lkml"
include: "/views/domain_22/view_07772.view.lkml"

explore: explore_2589 {
  label: "Explore Explore 2589"
  description: "Comprehensive analytics explore joining base view_07768 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07768
  
  always_filter: {
    filters: [view_07768.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07768.created_at_date: "7 days"]
    unless: [view_07768.id, view_07768.status]
  }

  join: view_07770 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07768.user_id} = ${view_07770.id} ;;
    required_joins: []
  }

  join: view_07771 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07768.account_id} = ${view_07771.account_id} ;;
    required_joins: [view_07770]
  }

  join: view_07772 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07768.category} = ${view_07772.category} ;;
  }

  access_filter: {
    field: view_07768.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07768.is_deleted} = false ;;
}
