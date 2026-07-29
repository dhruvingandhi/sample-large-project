# Explore: explore_1589
# Auto-generated LookML Explore File

include: "/views/domain_18/view_04768.view.lkml"
include: "/views/domain_20/view_04770.view.lkml"
include: "/views/domain_21/view_04771.view.lkml"
include: "/views/domain_22/view_04772.view.lkml"

explore: explore_1589 {
  label: "Explore Explore 1589"
  description: "Comprehensive analytics explore joining base view_04768 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04768
  
  always_filter: {
    filters: [view_04768.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04768.created_at_date: "7 days"]
    unless: [view_04768.id, view_04768.status]
  }

  join: view_04770 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04768.user_id} = ${view_04770.id} ;;
    required_joins: []
  }

  join: view_04771 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04768.account_id} = ${view_04771.account_id} ;;
    required_joins: [view_04770]
  }

  join: view_04772 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04768.category} = ${view_04772.category} ;;
  }

  access_filter: {
    field: view_04768.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04768.is_deleted} = false ;;
}
