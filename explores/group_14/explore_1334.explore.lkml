# Explore: explore_1334
# Auto-generated LookML Explore File

include: "/views/domain_03/view_04003.view.lkml"
include: "/views/domain_05/view_04005.view.lkml"
include: "/views/domain_06/view_04006.view.lkml"
include: "/views/domain_07/view_04007.view.lkml"

explore: explore_1334 {
  label: "Explore Explore 1334"
  description: "Comprehensive analytics explore joining base view_04003 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04003
  
  always_filter: {
    filters: [view_04003.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04003.created_at_date: "7 days"]
    unless: [view_04003.id, view_04003.status]
  }

  join: view_04005 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04003.user_id} = ${view_04005.id} ;;
    required_joins: []
  }

  join: view_04006 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04003.account_id} = ${view_04006.account_id} ;;
    required_joins: [view_04005]
  }

  join: view_04007 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04003.category} = ${view_04007.category} ;;
  }

  access_filter: {
    field: view_04003.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04003.is_deleted} = false ;;
}
