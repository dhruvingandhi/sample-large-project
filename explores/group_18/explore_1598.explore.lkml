# Explore: explore_1598
# Auto-generated LookML Explore File

include: "/views/domain_45/view_04795.view.lkml"
include: "/views/domain_47/view_04797.view.lkml"
include: "/views/domain_48/view_04798.view.lkml"
include: "/views/domain_49/view_04799.view.lkml"

explore: explore_1598 {
  label: "Explore Explore 1598"
  description: "Comprehensive analytics explore joining base view_04795 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04795
  
  always_filter: {
    filters: [view_04795.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04795.created_at_date: "7 days"]
    unless: [view_04795.id, view_04795.status]
  }

  join: view_04797 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04795.user_id} = ${view_04797.id} ;;
    required_joins: []
  }

  join: view_04798 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04795.account_id} = ${view_04798.account_id} ;;
    required_joins: [view_04797]
  }

  join: view_04799 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04795.category} = ${view_04799.category} ;;
  }

  access_filter: {
    field: view_04795.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04795.is_deleted} = false ;;
}
